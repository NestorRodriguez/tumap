import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MinarmapaPage } from './minarmapa.page';

describe('MinarmapaPage', () => {
  let component: MinarmapaPage;
  let fixture: ComponentFixture<MinarmapaPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MinarmapaPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MinarmapaPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
