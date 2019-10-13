import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MinaregistroPage } from './minaregistro.page';

describe('MinaregistroPage', () => {
  let component: MinaregistroPage;
  let fixture: ComponentFixture<MinaregistroPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MinaregistroPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MinaregistroPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
