import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ComercioformalPage } from './comercioformal.page';

describe('ComercioformalPage', () => {
  let component: ComercioformalPage;
  let fixture: ComponentFixture<ComercioformalPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ComercioformalPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ComercioformalPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
