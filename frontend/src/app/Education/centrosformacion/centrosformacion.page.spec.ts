import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CentrosformacionPage } from './centrosformacion.page';

describe('CentrosformacionPage', () => {
  let component: CentrosformacionPage;
  let fixture: ComponentFixture<CentrosformacionPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CentrosformacionPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CentrosformacionPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
